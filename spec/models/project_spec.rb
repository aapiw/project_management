require 'rails_helper'

RSpec.describe Project, type: :model do
  subject { create(:project) } # Using FactoryBot for test data

  describe 'associations' do
    it { should have_many(:project_assignments) }
    it { should have_many(:users).through(:project_assignments) }
    it { should have_many(:tasks) }
  end

  describe 'scopes' do
    let!(:active_project) { create(:project, start_date: Date.current - 1.day, end_date: Date.current + 1.day) }
    let!(:inactive_project) { create(:project, start_date: Date.current - 10.days, end_date: Date.current - 1.day) }

    it 'returns only active projects' do
      expect(Project.active).to include(active_project)
      expect(Project.active).not_to include(inactive_project)
    end
  end

  describe 'callbacks' do
    context 'before save' do
      it 'sets the end_date if start_date or duration changes' do
        project = create(:project, start_date: Date.today, duration: 10)
        initial_end_date = project.end_date
        project.update(start_date: Date.today + 1.day)
        expect(project.end_date).not_to eq(initial_end_date)
      end
    end
  end

  describe 'instance methods' do
    let(:project) { create(:project) }

    describe '#assign_users' do
      let!(:user) { create(:user) }
      
      it 'assigns users to the project' do
        expect { project.assign_users([user.id]) }.to change { project.users.count }.by(1)
      end

      it 'does not assign duplicate users' do
        project.assign_users([user.id])
        expect { project.assign_users([user.id]) }.not_to change { project.users.count }
      end
    end

    describe '#unassign_users' do
      let!(:user) { create(:user) }
      
      before { project.assign_users([user.id]) }

      it 'unassigns users from the project' do
        expect { project.unassign_users([user.id]) }.to change { project.users.count }.by(-1)
      end

      it 'does not unassign users who are not assigned' do
        new_user = create(:user)
        expect { project.unassign_users([new_user.id]) }.not_to change { project.users.count }
      end
    end

    describe '#assign_tasks' do
      let!(:task) { create(:task) }

      it 'assigns tasks to the project' do
        expect { project.assign_tasks([task.id]) }.to change { project.tasks.count }.by(1)
      end

      it 'does not assign duplicate tasks' do
        project.assign_tasks([task.id])
        expect { project.assign_tasks([task.id]) }.not_to change { project.tasks.count }
      end
    end

    describe '#unassign_tasks' do
      let!(:task) { create(:task) }
      
      before { project.assign_tasks([task.id]) }

      it 'unassigns tasks from the project' do
        expect { project.unassign_tasks([task.id]) }.to change { project.tasks.count }.by(-1)
      end

      it 'does not unassign tasks that are not assigned' do
        new_task = create(:task)
        expect { project.unassign_tasks([new_task.id]) }.not_to change { project.tasks.count }
      end
    end
  end

  describe 'class methods' do
    describe '.display_hour' do
      it 'returns "hour" for 1 hour' do
        expect(Project.display_hour(1)).to eq('hour')
      end

      it 'returns "X hours" for more than 1 hour' do
        expect(Project.display_hour(2)).to eq('2 hours')
      end
    end
  end
end
